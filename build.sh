pip install --upgrade pip
pip install django==3.2.19
pip install django-crispy-forms==1.11.2
pip install dj-database-url==0.5.0
pip install gunicorn==20.1.0
pip install psycopg2-binary==2.9.5
pip install whitenoise==5.2.0
pip install django-ckeditor==6.0.0
pip install cloudinary==1.25.0
pip install crispy-tailwind
pip install Pillow
pip install requests
pip install psycopg2
pip install paystack
pip install paystackapi
pip install django-social-share==2.2.1
pip install django-import-export==2.5.0
pip install django-allauth==0.51.0
pip install django-rest-framework==0.1.0
pip install djangorestframework==3.13.
pip install -r requirements.txt
python manage.py makemigrations
python manage.py migrate
python3 manage.py collectstatic --clear --noinput
python3 manage.py collectstatic --noinput


SUPERUSER_USERNAME="PetrJoe"
SUPERUSER_EMAIL="petrjoe01@gmail.com"
SUPERUSER_PASSWORD="Educational@01"



# Check if the superuser already exists
if python3 manage.py shell -c "from accounts.models import User; User.objects.filter(username='$SUPERUSER_USERNAME').exists()" ; then
    read -p "Superuser '$SUPERUSER_USERNAME' already exists. Do you want to update the password? (y/n): " update_password

    if [ "$update_password" == "y" ]; then
        # Update the password for the existing superuser
        echo "accounts.models import User; user = User.objects.get(username='$SUPERUSER_USERNAME'); user.set_password('$SUPERUSER_PASSWORD'); user.save()" | python3 manage.py shell
        echo "Password updated for superuser '$SUPERUSER_USERNAME'."
    else
        echo "Superuser creation aborted."
    fi
else
    # Create the superuser
    python3 manage.py createsuperuser --username="$SUPERUSER_USERNAME" --email="$SUPERUSER_EMAIL" --noinput
    echo "from accounts.models import User; user = User.objects.get(username='$SUPERUSER_USERNAME'); user.set_password('$SUPERUSER_PASSWORD'); user.save()" | python3 manage.py shell
    echo "Superuser '$SUPERUSER_USERNAME' created successfully."