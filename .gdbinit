set history save on

python
# Load Facebook STL pretty printers.
import os
if 'facebook' in os.environ.get('HOSTNAME'):
  gdb.execute('fbload stl')
end
