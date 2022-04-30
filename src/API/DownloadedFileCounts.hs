-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.DownloadedFileCounts where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Contains number of being downloaded and recently downloaded files found
-- 
-- __active_count__ Number of active file downloads found, including paused
-- 
-- __paused_count__ Number of paused file downloads found
-- 
-- __completed_count__ Number of completed file downloads found
data DownloadedFileCounts = 

 DownloadedFileCounts { completed_count :: Maybe Int, paused_count :: Maybe Int, active_count :: Maybe Int }  deriving (Eq)

instance Show DownloadedFileCounts where
 show DownloadedFileCounts { completed_count=completed_count, paused_count=paused_count, active_count=active_count } =
  "DownloadedFileCounts" ++ U.cc [U.p "completed_count" completed_count, U.p "paused_count" paused_count, U.p "active_count" active_count ]

instance T.ToJSON DownloadedFileCounts where
 toJSON DownloadedFileCounts { completed_count = completed_count, paused_count = paused_count, active_count = active_count } =
  A.object [ "@type" A..= T.String "downloadedFileCounts", "completed_count" A..= completed_count, "paused_count" A..= paused_count, "active_count" A..= active_count ]

instance T.FromJSON DownloadedFileCounts where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "downloadedFileCounts" -> parseDownloadedFileCounts v
   _ -> mempty
  where
   parseDownloadedFileCounts :: A.Value -> T.Parser DownloadedFileCounts
   parseDownloadedFileCounts = A.withObject "DownloadedFileCounts" $ \o -> do
    completed_count <- mconcat [ o A..:? "completed_count", readMaybe <$> (o A..: "completed_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    paused_count <- mconcat [ o A..:? "paused_count", readMaybe <$> (o A..: "paused_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    active_count <- mconcat [ o A..:? "active_count", readMaybe <$> (o A..: "active_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ DownloadedFileCounts { completed_count = completed_count, paused_count = paused_count, active_count = active_count }
 parseJSON _ = mempty
