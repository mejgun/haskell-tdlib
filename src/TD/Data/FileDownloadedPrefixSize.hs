module TD.Data.FileDownloadedPrefixSize
  (FileDownloadedPrefixSize(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data FileDownloadedPrefixSize
  = FileDownloadedPrefixSize -- ^ Contains size of downloaded prefix of a file
    { size :: Maybe Int -- ^ The prefix size, in bytes
    }
  deriving (Eq, Show)

instance I.ShortShow FileDownloadedPrefixSize where
  shortShow FileDownloadedPrefixSize
    { size = size_
    }
      = "FileDownloadedPrefixSize"
        ++ I.cc
        [ "size" `I.p` size_
        ]

instance AT.FromJSON FileDownloadedPrefixSize where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "fileDownloadedPrefixSize" -> parseFileDownloadedPrefixSize v
      _                          -> mempty
    
    where
      parseFileDownloadedPrefixSize :: A.Value -> AT.Parser FileDownloadedPrefixSize
      parseFileDownloadedPrefixSize = A.withObject "FileDownloadedPrefixSize" $ \o -> do
        size_ <- o A..:?  "size"
        pure $ FileDownloadedPrefixSize
          { size = size_
          }
  parseJSON _ = mempty

