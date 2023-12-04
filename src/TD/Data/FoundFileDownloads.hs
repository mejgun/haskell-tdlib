module TD.Data.FoundFileDownloads
  (FoundFileDownloads(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.DownloadedFileCounts as DownloadedFileCounts
import qualified TD.Data.FileDownload as FileDownload
import qualified Data.Text as T

data FoundFileDownloads
  = FoundFileDownloads -- ^ Contains a list of downloaded files, found by a search
    { total_counts :: Maybe DownloadedFileCounts.DownloadedFileCounts -- ^ Total number of suitable files, ignoring offset
    , files        :: Maybe [FileDownload.FileDownload]               -- ^ The list of files
    , next_offset  :: Maybe T.Text                                    -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow FoundFileDownloads where
  shortShow FoundFileDownloads
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
  parseJSON _ = mempty

