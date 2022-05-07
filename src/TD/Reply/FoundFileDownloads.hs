{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.FoundFileDownloads where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.DownloadedFileCounts as DownloadedFileCounts
import qualified TD.Reply.FileDownload as FileDownload
import qualified Utils as U

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
      { next_offset = next_offset,
        files = files,
        total_counts = total_counts
      } =
      "FoundFileDownloads"
        ++ U.cc
          [ U.p "next_offset" next_offset,
            U.p "files" files,
            U.p "total_counts" total_counts
          ]

instance T.FromJSON FoundFileDownloads where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "foundFileDownloads" -> parseFoundFileDownloads v
      _ -> fail ""
    where
      parseFoundFileDownloads :: A.Value -> T.Parser FoundFileDownloads
      parseFoundFileDownloads = A.withObject "FoundFileDownloads" $ \o -> do
        next_offset_ <- o A..:? "next_offset"
        files_ <- o A..:? "files"
        total_counts_ <- o A..:? "total_counts"
        return $ FoundFileDownloads {next_offset = next_offset_, files = files_, total_counts = total_counts_}
  parseJSON _ = fail ""

instance T.ToJSON FoundFileDownloads where
  toJSON
    FoundFileDownloads
      { next_offset = next_offset,
        files = files,
        total_counts = total_counts
      } =
      A.object
        [ "@type" A..= T.String "foundFileDownloads",
          "next_offset" A..= next_offset,
          "files" A..= files,
          "total_counts" A..= total_counts
        ]
