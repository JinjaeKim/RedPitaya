git filter-branch -f --prune-empty --index-filter 'git rm -rf --cached --ignore-unmatch api/rpApplications Applications/scopegenpro Applications/spectrumpro Bazaar/nginx/ngx_ext_modules/ws_server/rp_sdk/licverify remove-proprietary.sh' HEAD