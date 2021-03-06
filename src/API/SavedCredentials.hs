-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.SavedCredentials where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Contains information about saved card credentials 
-- 
-- __id__ Unique identifier of the saved credentials
-- 
-- __title__ Title of the saved credentials
data SavedCredentials = 

 SavedCredentials { title :: Maybe String, _id :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON SavedCredentials where
 toJSON (SavedCredentials { title = title, _id = _id }) =
  A.object [ "@type" A..= T.String "savedCredentials", "title" A..= title, "id" A..= _id ]

instance T.FromJSON SavedCredentials where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "savedCredentials" -> parseSavedCredentials v
   _ -> mempty
  where
   parseSavedCredentials :: A.Value -> T.Parser SavedCredentials
   parseSavedCredentials = A.withObject "SavedCredentials" $ \o -> do
    title <- o A..:? "title"
    _id <- o A..:? "id"
    return $ SavedCredentials { title = title, _id = _id }