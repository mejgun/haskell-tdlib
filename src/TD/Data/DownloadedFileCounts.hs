module TD.Data.DownloadedFileCounts
  (DownloadedFileCounts(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data DownloadedFileCounts
  = DownloadedFileCounts -- ^ Contains number of being downloaded and recently downloaded files found
    { active_count    :: Maybe Int -- ^ Number of active file downloads found, including paused
    , paused_count    :: Maybe Int -- ^ Number of paused file downloads found
    , completed_count :: Maybe Int -- ^ Number of completed file downloads found
    }
  deriving (Eq, Show)

instance I.ShortShow DownloadedFileCounts where
  shortShow DownloadedFileCounts
    { active_count    = active_count_
    , paused_count    = paused_count_
    , completed_count = completed_count_
    }
      = "DownloadedFileCounts"
        ++ I.cc
        [ "active_count"    `I.p` active_count_
        , "paused_count"    `I.p` paused_count_
        , "completed_count" `I.p` completed_count_
        ]

instance AT.FromJSON DownloadedFileCounts where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "downloadedFileCounts" -> parseDownloadedFileCounts v
      _                      -> mempty
    
    where
      parseDownloadedFileCounts :: A.Value -> AT.Parser DownloadedFileCounts
      parseDownloadedFileCounts = A.withObject "DownloadedFileCounts" $ \o -> do
        active_count_    <- o A..:?  "active_count"
        paused_count_    <- o A..:?  "paused_count"
        completed_count_ <- o A..:?  "completed_count"
        pure $ DownloadedFileCounts
          { active_count    = active_count_
          , paused_count    = paused_count_
          , completed_count = completed_count_
          }
  parseJSON _ = mempty

