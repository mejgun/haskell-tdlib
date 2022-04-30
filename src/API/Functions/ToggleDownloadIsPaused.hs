-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleDownloadIsPaused where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Changes pause state of a file in the file download list
-- 
-- __file_id__ Identifier of the downloaded file
-- 
-- __is_paused__ Pass true if the download is paused
data ToggleDownloadIsPaused = 

 ToggleDownloadIsPaused { is_paused :: Maybe Bool, file_id :: Maybe Int }  deriving (Eq)

instance Show ToggleDownloadIsPaused where
 show ToggleDownloadIsPaused { is_paused=is_paused, file_id=file_id } =
  "ToggleDownloadIsPaused" ++ U.cc [U.p "is_paused" is_paused, U.p "file_id" file_id ]

instance T.ToJSON ToggleDownloadIsPaused where
 toJSON ToggleDownloadIsPaused { is_paused = is_paused, file_id = file_id } =
  A.object [ "@type" A..= T.String "toggleDownloadIsPaused", "is_paused" A..= is_paused, "file_id" A..= file_id ]

instance T.FromJSON ToggleDownloadIsPaused where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "toggleDownloadIsPaused" -> parseToggleDownloadIsPaused v
   _ -> mempty
  where
   parseToggleDownloadIsPaused :: A.Value -> T.Parser ToggleDownloadIsPaused
   parseToggleDownloadIsPaused = A.withObject "ToggleDownloadIsPaused" $ \o -> do
    is_paused <- o A..:? "is_paused"
    file_id <- mconcat [ o A..:? "file_id", readMaybe <$> (o A..: "file_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ToggleDownloadIsPaused { is_paused = is_paused, file_id = file_id }
 parseJSON _ = mempty
