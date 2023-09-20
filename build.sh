pip install --upgrade pip
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
fi
