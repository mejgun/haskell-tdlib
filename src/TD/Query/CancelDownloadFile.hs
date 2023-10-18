module TD.Query.CancelDownloadFile
  (CancelDownloadFile(..)
  , defaultCancelDownloadFile
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Stops the downloading of a file. If a file has already been downloaded, does nothing. Returns 'TD.Data.Ok.Ok'
data CancelDownloadFile
  = CancelDownloadFile
    { file_id         :: Maybe Int  -- ^ Identifier of a file to stop downloading
    , only_if_pending :: Maybe Bool -- ^ Pass true to stop downloading only if it hasn't been started, i.e. request hasn't been sent to server
    }
  deriving (Eq, Show)

instance I.ShortShow CancelDownloadFile where
  shortShow
    CancelDownloadFile
      { file_id         = file_id_
      , only_if_pending = only_if_pending_
      }
        = "CancelDownloadFile"
          ++ I.cc
          [ "file_id"         `I.p` file_id_
          , "only_if_pending" `I.p` only_if_pending_
          ]

instance AT.ToJSON CancelDownloadFile where
  toJSON
    CancelDownloadFile
      { file_id         = file_id_
      , only_if_pending = only_if_pending_
      }
        = A.object
          [ "@type"           A..= AT.String "cancelDownloadFile"
          , "file_id"         A..= file_id_
          , "only_if_pending" A..= only_if_pending_
          ]

defaultCancelDownloadFile :: CancelDownloadFile
defaultCancelDownloadFile =
  CancelDownloadFile
    { file_id         = Nothing
    , only_if_pending = Nothing
    }

