module TD.Query.GetFileDownloadedPrefixSize
  (GetFileDownloadedPrefixSize(..)
  , defaultGetFileDownloadedPrefixSize
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns file downloaded prefix size from a given offset, in bytes. Returns 'TD.Data.FileDownloadedPrefixSize.FileDownloadedPrefixSize'
data GetFileDownloadedPrefixSize
  = GetFileDownloadedPrefixSize
    { file_id :: Maybe Int -- ^ Identifier of the file
    , offset  :: Maybe Int -- ^ Offset from which downloaded prefix size needs to be calculated
    }
  deriving (Eq, Show)

instance I.ShortShow GetFileDownloadedPrefixSize where
  shortShow
    GetFileDownloadedPrefixSize
      { file_id = file_id_
      , offset  = offset_
      }
        = "GetFileDownloadedPrefixSize"
          ++ I.cc
          [ "file_id" `I.p` file_id_
          , "offset"  `I.p` offset_
          ]

instance AT.ToJSON GetFileDownloadedPrefixSize where
  toJSON
    GetFileDownloadedPrefixSize
      { file_id = file_id_
      , offset  = offset_
      }
        = A.object
          [ "@type"   A..= AT.String "getFileDownloadedPrefixSize"
          , "file_id" A..= file_id_
          , "offset"  A..= offset_
          ]

defaultGetFileDownloadedPrefixSize :: GetFileDownloadedPrefixSize
defaultGetFileDownloadedPrefixSize =
  GetFileDownloadedPrefixSize
    { file_id = Nothing
    , offset  = Nothing
    }

