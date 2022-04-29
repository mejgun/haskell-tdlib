-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveFileFromDownloads where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Removes a file from the file download list 
-- 
-- __file_id__ Identifier of the downloaded file
-- 
-- __delete_from_cache__ Pass true to delete the file from the TDLib file cache
data RemoveFileFromDownloads = 

 RemoveFileFromDownloads { delete_from_cache :: Maybe Bool, file_id :: Maybe Int }  deriving (Eq)

instance Show RemoveFileFromDownloads where
 show RemoveFileFromDownloads { delete_from_cache=delete_from_cache, file_id=file_id } =
  "RemoveFileFromDownloads" ++ cc [p "delete_from_cache" delete_from_cache, p "file_id" file_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON RemoveFileFromDownloads where
 toJSON RemoveFileFromDownloads { delete_from_cache = delete_from_cache, file_id = file_id } =
  A.object [ "@type" A..= T.String "removeFileFromDownloads", "delete_from_cache" A..= delete_from_cache, "file_id" A..= file_id ]

instance T.FromJSON RemoveFileFromDownloads where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeFileFromDownloads" -> parseRemoveFileFromDownloads v
   _ -> mempty
  where
   parseRemoveFileFromDownloads :: A.Value -> T.Parser RemoveFileFromDownloads
   parseRemoveFileFromDownloads = A.withObject "RemoveFileFromDownloads" $ \o -> do
    delete_from_cache <- o A..:? "delete_from_cache"
    file_id <- mconcat [ o A..:? "file_id", readMaybe <$> (o A..: "file_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ RemoveFileFromDownloads { delete_from_cache = delete_from_cache, file_id = file_id }
 parseJSON _ = mempty
