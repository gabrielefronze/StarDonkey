echo "=================================================================================="
echo "Virgo Rucio Torino test environment"
echo "----------------------------------------------------------------------------------"
echo "Setting up database:"
python setup_database.py
echo "----------------------------------------------------------------------------------"
echo "Creating accounts:"
python setup_accounts.py
echo "----------------------------------------------------------------------------------"
echo "Registering CNAF storage elements:"
python setup_CNAF.py
echo "----------------------------------------------------------------------------------"
echo "Registering CCIN2P3 storage elements:"
python setup_CCIN2P3.py
echo "=================================================================================="