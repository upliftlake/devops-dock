# install azcopy 
# always run it from a good machine from the cloud (not B-Series), otherwise it will take ages

azcopy copy \
'https://sourceStorageAccount.blob.core.windows.net/sourceContainerName/blobPath/blobDirectory?sv=gibberish' \
'https://destinationStorageAccount.blob.core.windows.net/destinationContainerName/?sv=gibberish' \
--recursive --s2s-preserve-properties 