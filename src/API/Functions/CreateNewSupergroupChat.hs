-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateNewSupergroupChat where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatLocation as ChatLocation

data CreateNewSupergroupChat = 
 CreateNewSupergroupChat { location :: Maybe ChatLocation.ChatLocation, description :: Maybe String, is_channel :: Maybe Bool, title :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON CreateNewSupergroupChat where
 toJSON (CreateNewSupergroupChat { location = location, description = description, is_channel = is_channel, title = title }) =
  A.object [ "@type" A..= T.String "createNewSupergroupChat", "location" A..= location, "description" A..= description, "is_channel" A..= is_channel, "title" A..= title ]

instance T.FromJSON CreateNewSupergroupChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "createNewSupergroupChat" -> parseCreateNewSupergroupChat v
   _ -> mempty
  where
   parseCreateNewSupergroupChat :: A.Value -> T.Parser CreateNewSupergroupChat
   parseCreateNewSupergroupChat = A.withObject "CreateNewSupergroupChat" $ \o -> do
    location <- optional $ o A..: "location"
    description <- optional $ o A..: "description"
    is_channel <- optional $ o A..: "is_channel"
    title <- optional $ o A..: "title"
    return $ CreateNewSupergroupChat { location = location, description = description, is_channel = is_channel, title = title }