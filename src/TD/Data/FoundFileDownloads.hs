module TD.Data.FoundFileDownloads where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.DownloadedFileCounts as DownloadedFileCounts
import qualified TD.Data.FileDownload as FileDownload

data FoundFileDownloads
  = FoundFileDownloads -- ^ Contains a list of downloaded files, found by a search
    { total_counts :: Maybe DownloadedFileCounts.DownloadedFileCounts -- ^ Total number of suitable files, ignoring offset
    , files        :: Maybe [FileDownload.FileDownload]               -- ^ The list of files
    , next_offset  :: Maybe T.Text                                    -- ^ The offset for the next request. If empty, there are no more results
    }
  deriving (Eq)

instance Show FoundFileDownloads where
  show FoundFileDownloads
    { total_counts = total_counts_
    , files        = files_
    , next_offset  = next_offset_
    }
      = "FoundFileDownloads"
        ++ I.cc
        [ "total_counts" `I.p` total_counts_
        , "files"        `I.p` files_
        , "next_offset"  `I.p` next_offset_
        ]

instance AT.FromJSON FoundFileDownloads where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "foundFileDownloads" -> parseFoundFileDownloads v
      _                    -> mempty
    
    where
      parseFoundFileDownloads :: A.Value -> AT.Parser FoundFileDownloads
      parseFoundFileDownloads = A.withObject "FoundFileDownloads" $ \o -> do
        total_counts_ <- o A..:?  "total_counts"
        files_        <- o A..:?  "files"
        next_offset_  <- o A..:?  "next_offset"
        pure $ FoundFileDownloads
          { total_counts = total_counts_
          , files        = files_
          , next_offset  = next_offset_
          }

instance AT.ToJSON FoundFileDownloads where
  toJSON FoundFileDownloads
    { total_counts = total_counts_
    , files        = files_
    , next_offset  = next_offset_
    }
      = A.object
        [ "@type"        A..= AT.String "foundFileDownloads"
        , "total_counts" A..= total_counts_
        , "files"        A..= files_
        , "next_offset"  A..= next_offset_
        ]
