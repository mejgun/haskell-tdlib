-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSuggestedFileName where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns suggested name for saving a file in a given directory 
-- 
-- __file_id__ Identifier of the file
-- 
-- __directory__ Directory in which the file is supposed to be saved
data GetSuggestedFileName = 

 GetSuggestedFileName { directory :: Maybe String, file_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetSuggestedFileName where
 toJSON (GetSuggestedFileName { directory = directory, file_id = file_id }) =
  A.object [ "@type" A..= T.String "getSuggestedFileName", "directory" A..= directory, "file_id" A..= file_id ]

instance T.FromJSON GetSuggestedFileName where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getSuggestedFileName" -> parseGetSuggestedFileName v
   _ -> mempty
  where
   parseGetSuggestedFileName :: A.Value -> T.Parser GetSuggestedFileName
   parseGetSuggestedFileName = A.withObject "GetSuggestedFileName" $ \o -> do
    directory <- o A..:? "directory"
    file_id <- mconcat [ o A..:? "file_id", readMaybe <$> (o A..: "file_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetSuggestedFileName { directory = directory, file_id = file_id }