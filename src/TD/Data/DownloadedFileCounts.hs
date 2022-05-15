{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.DownloadedFileCounts where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data DownloadedFileCounts = -- | Contains number of being downloaded and recently downloaded files found
  DownloadedFileCounts
  { -- | Number of completed file downloads found
    completed_count :: Maybe Int,
    -- | Number of paused file downloads found
    paused_count :: Maybe Int,
    -- | Number of active file downloads found, including paused
    active_count :: Maybe Int
  }
  deriving (Eq)

instance Show DownloadedFileCounts where
  show
    DownloadedFileCounts
      { completed_count = completed_count_,
        paused_count = paused_count_,
        active_count = active_count_
      } =
      "DownloadedFileCounts"
        ++ U.cc
          [ U.p "completed_count" completed_count_,
            U.p "paused_count" paused_count_,
            U.p "active_count" active_count_
          ]

instance T.FromJSON DownloadedFileCounts where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "downloadedFileCounts" -> parseDownloadedFileCounts v
      _ -> mempty
    where
      parseDownloadedFileCounts :: A.Value -> T.Parser DownloadedFileCounts
      parseDownloadedFileCounts = A.withObject "DownloadedFileCounts" $ \o -> do
        completed_count_ <- o A..:? "completed_count"
        paused_count_ <- o A..:? "paused_count"
        active_count_ <- o A..:? "active_count"
        return $ DownloadedFileCounts {completed_count = completed_count_, paused_count = paused_count_, active_count = active_count_}
  parseJSON _ = mempty

instance T.ToJSON DownloadedFileCounts where
  toJSON
    DownloadedFileCounts
      { completed_count = completed_count_,
        paused_count = paused_count_,
        active_count = active_count_
      } =
      A.object
        [ "@type" A..= T.String "downloadedFileCounts",
          "completed_count" A..= completed_count_,
          "paused_count" A..= paused_count_,
          "active_count" A..= active_count_
        ]
