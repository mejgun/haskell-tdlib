-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CancelDownloadFile where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Stops the downloading of a file. If a file has already been downloaded, does nothing 
-- 
-- __file_id__ Identifier of a file to stop downloading
-- 
-- __only_if_pending__ Pass true to stop downloading only if it hasn't been started, i.e. request hasn't been sent to server
data CancelDownloadFile = 

 CancelDownloadFile { only_if_pending :: Maybe Bool, file_id :: Maybe Int }  deriving (Eq)

instance Show CancelDownloadFile where
 show CancelDownloadFile { only_if_pending=only_if_pending, file_id=file_id } =
  "CancelDownloadFile" ++ cc [p "only_if_pending" only_if_pending, p "file_id" file_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON CancelDownloadFile where
 toJSON CancelDownloadFile { only_if_pending = only_if_pending, file_id = file_id } =
  A.object [ "@type" A..= T.String "cancelDownloadFile", "only_if_pending" A..= only_if_pending, "file_id" A..= file_id ]

instance T.FromJSON CancelDownloadFile where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "cancelDownloadFile" -> parseCancelDownloadFile v
   _ -> mempty
  where
   parseCancelDownloadFile :: A.Value -> T.Parser CancelDownloadFile
   parseCancelDownloadFile = A.withObject "CancelDownloadFile" $ \o -> do
    only_if_pending <- o A..:? "only_if_pending"
    file_id <- mconcat [ o A..:? "file_id", readMaybe <$> (o A..: "file_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ CancelDownloadFile { only_if_pending = only_if_pending, file_id = file_id }
 parseJSON _ = mempty
