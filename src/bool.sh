#!/bin/bash
echo "# And"
if false && false; then echo "True"; else echo "False"; fi
if false && true;  then echo "True"; else echo "False"; fi
if true  && false; then echo "True"; else echo "False"; fi
if true  && true;  then echo "True"; else echo "False"; fi

echo "# OR"
if false || false; then echo "True"; else echo "False"; fi
if false || true;  then echo "True"; else echo "False"; fi
if true  || false; then echo "True"; else echo "False"; fi
if true  || true;  then echo "True"; else echo "False"; fi
