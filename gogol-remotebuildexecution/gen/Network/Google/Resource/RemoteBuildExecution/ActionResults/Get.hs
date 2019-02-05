{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE FlexibleInstances  #-}
{-# LANGUAGE NoImplicitPrelude  #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds      #-}
{-# OPTIONS_GHC -fno-warn-unused-imports    #-}

-- |
-- Module      : Network.Google.Resource.RemoteBuildExecution.ActionResults.Get
-- Copyright   : (c) 2015-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Retrieve a cached execution result. Errors: * \`NOT_FOUND\`: The
-- requested \`ActionResult\` is not in the cache.
--
-- /See:/ <https://cloud.google.com/remote-build-execution/docs/ Remote Build Execution API Reference> for @remotebuildexecution.actionResults.get@.
module Network.Google.Resource.RemoteBuildExecution.ActionResults.Get
    (
    -- * REST Resource
      ActionResultsGetResource

    -- * Creating a Request
    , actionResultsGet
    , ActionResultsGet

    -- * Request Lenses
    , argSizeBytes
    , argXgafv
    , argHash
    , argUploadProtocol
    , argAccessToken
    , argUploadType
    , argInstanceName
    , argCallback
    ) where

import           Network.Google.Prelude
import           Network.Google.RemoteBuildExecution.Types

-- | A resource alias for @remotebuildexecution.actionResults.get@ method which the
-- 'ActionResultsGet' request conforms to.
type ActionResultsGetResource =
     "v2" :>
       Capture "instanceName" Text :>
         "actionResults" :>
           Capture "hash" Text :>
             Capture "sizeBytes" (Textual Int64) :>
               QueryParam "$.xgafv" Xgafv :>
                 QueryParam "upload_protocol" Text :>
                   QueryParam "access_token" Text :>
                     QueryParam "uploadType" Text :>
                       QueryParam "callback" Text :>
                         QueryParam "alt" AltJSON :>
                           Get '[JSON] BuildBazelRemoteExecutionV2ActionResult

-- | Retrieve a cached execution result. Errors: * \`NOT_FOUND\`: The
-- requested \`ActionResult\` is not in the cache.
--
-- /See:/ 'actionResultsGet' smart constructor.
data ActionResultsGet = ActionResultsGet'
    { _argSizeBytes      :: !(Textual Int64)
    , _argXgafv          :: !(Maybe Xgafv)
    , _argHash           :: !Text
    , _argUploadProtocol :: !(Maybe Text)
    , _argAccessToken    :: !(Maybe Text)
    , _argUploadType     :: !(Maybe Text)
    , _argInstanceName   :: !Text
    , _argCallback       :: !(Maybe Text)
    } deriving (Eq,Show,Data,Typeable,Generic)

-- | Creates a value of 'ActionResultsGet' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'argSizeBytes'
--
-- * 'argXgafv'
--
-- * 'argHash'
--
-- * 'argUploadProtocol'
--
-- * 'argAccessToken'
--
-- * 'argUploadType'
--
-- * 'argInstanceName'
--
-- * 'argCallback'
actionResultsGet
    :: Int64 -- ^ 'argSizeBytes'
    -> Text -- ^ 'argHash'
    -> Text -- ^ 'argInstanceName'
    -> ActionResultsGet
actionResultsGet pArgSizeBytes_ pArgHash_ pArgInstanceName_ =
    ActionResultsGet'
    { _argSizeBytes = _Coerce # pArgSizeBytes_
    , _argXgafv = Nothing
    , _argHash = pArgHash_
    , _argUploadProtocol = Nothing
    , _argAccessToken = Nothing
    , _argUploadType = Nothing
    , _argInstanceName = pArgInstanceName_
    , _argCallback = Nothing
    }

-- | The size of the blob, in bytes.
argSizeBytes :: Lens' ActionResultsGet Int64
argSizeBytes
  = lens _argSizeBytes (\ s a -> s{_argSizeBytes = a})
      . _Coerce

-- | V1 error format.
argXgafv :: Lens' ActionResultsGet (Maybe Xgafv)
argXgafv = lens _argXgafv (\ s a -> s{_argXgafv = a})

-- | The hash. In the case of SHA-256, it will always be a lowercase hex
-- string exactly 64 characters long.
argHash :: Lens' ActionResultsGet Text
argHash = lens _argHash (\ s a -> s{_argHash = a})

-- | Upload protocol for media (e.g. \"raw\", \"multipart\").
argUploadProtocol :: Lens' ActionResultsGet (Maybe Text)
argUploadProtocol
  = lens _argUploadProtocol
      (\ s a -> s{_argUploadProtocol = a})

-- | OAuth access token.
argAccessToken :: Lens' ActionResultsGet (Maybe Text)
argAccessToken
  = lens _argAccessToken
      (\ s a -> s{_argAccessToken = a})

-- | Legacy upload protocol for media (e.g. \"media\", \"multipart\").
argUploadType :: Lens' ActionResultsGet (Maybe Text)
argUploadType
  = lens _argUploadType
      (\ s a -> s{_argUploadType = a})

-- | The instance of the execution system to operate against. A server may
-- support multiple instances of the execution system (with their own
-- workers, storage, caches, etc.). The server MAY require use of this
-- field to select between them in an implementation-defined fashion,
-- otherwise it can be omitted.
argInstanceName :: Lens' ActionResultsGet Text
argInstanceName
  = lens _argInstanceName
      (\ s a -> s{_argInstanceName = a})

-- | JSONP
argCallback :: Lens' ActionResultsGet (Maybe Text)
argCallback
  = lens _argCallback (\ s a -> s{_argCallback = a})

instance GoogleRequest ActionResultsGet where
        type Rs ActionResultsGet =
             BuildBazelRemoteExecutionV2ActionResult
        type Scopes ActionResultsGet =
             '["https://www.googleapis.com/auth/cloud-platform"]
        requestClient ActionResultsGet'{..}
          = go _argInstanceName _argHash _argSizeBytes
              _argXgafv
              _argUploadProtocol
              _argAccessToken
              _argUploadType
              _argCallback
              (Just AltJSON)
              remoteBuildExecutionService
          where go
                  = buildClient
                      (Proxy :: Proxy ActionResultsGetResource)
                      mempty
