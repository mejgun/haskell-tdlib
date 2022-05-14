{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.FoundFileDownloads where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.DownloadedFileCounts as DownloadedFileCounts
import qualified TD.Data.FileDownload as FileDownload
import qualified Utils as U

-- |
data FoundFileDownloads = -- | Contains a list of downloaded files, found by a search
  FoundFileDownloads
  { -- | The offset for the next request. If empty, there are no more results
    next_offset :: Maybe String,
    -- | The list of files
    files :: Maybe [FileDownload.FileDownload],
    -- | Total number of suitable files, ignoring offset
    total_counts :: Maybe DownloadedFileCounts.DownloadedFileCounts
  }
  deriving (Eq)

instance Show FoundFileDownloads where
  show
    FoundFileDownloads
      { next_offset = next_offset_,
        files = files_,
        total_counts = total_counts_
      } =
      "FoundFileDownloads"
        ++ U.cc
          [ U.p "next_offset" next_offset_,
            U.p "files" files_,
            U.p "total_counts" total_counts_
          ]

instance T.FromJSON FoundFileDownloads where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "foundFileDownloads" -> parseFoundFileDownloads v
      _ -> mempty
    where
      parseFoundFileDownloads :: A.Value -> T.Parser FoundFileDownloads
      parseFoundFileDownloads = A.withObject "FoundFileDownloads" $ \o -> do
        next_offset_ <- o A..:? "next_offset"
        files_ <- o A..:? "files"
        total_counts_ <- o A..:? "total_counts"
        return $ FoundFileDownloads {next_offset = next_offset_, files = files_, total_counts = total_counts_}
  parseJSON _ = mempty

instance T.ToJSON FoundFileDownloads where
  toJSON
    FoundFileDownloads
      { next_offset = next_offset_,
        files = files_,
        total_counts = total_counts_
      } =
      A.object
        [ "@type" A..= T.String "foundFileDownloads",
          "next_offset" A..= next_offset_,
          "files" A..= files_,
          "total_counts" A..= total_counts_
        ]
