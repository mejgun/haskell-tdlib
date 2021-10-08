-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateNewSupergroupChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ChatLocation as ChatLocation

-- |
-- 
-- Creates a new supergroup or channel and sends a corresponding messageSupergroupChatCreate. Returns the newly created chat
-- 
-- __title__ Title of the new chat; 1-128 characters
-- 
-- __is_channel__ True, if a channel chat needs to be created
-- 
-- __param_description__ Chat description; 0-255 characters
-- 
-- __location__ Chat location if a location-based supergroup is being created; pass null to create an ordinary supergroup chat
-- 
-- __for_import__ True, if the supergroup is created for importing messages using importMessage
data CreateNewSupergroupChat = 

 CreateNewSupergroupChat { for_import :: Maybe Bool, location :: Maybe ChatLocation.ChatLocation, description :: Maybe String, is_channel :: Maybe Bool, title :: Maybe String }  deriving (Eq)

instance Show CreateNewSupergroupChat where
 show CreateNewSupergroupChat { for_import=for_import, location=location, description=description, is_channel=is_channel, title=title } =
  "CreateNewSupergroupChat" ++ cc [p "for_import" for_import, p "location" location, p "description" description, p "is_channel" is_channel, p "title" title ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON CreateNewSupergroupChat where
 toJSON CreateNewSupergroupChat { for_import = for_import, location = location, description = description, is_channel = is_channel, title = title } =
  A.object [ "@type" A..= T.String "createNewSupergroupChat", "for_import" A..= for_import, "location" A..= location, "description" A..= description, "is_channel" A..= is_channel, "title" A..= title ]

instance T.FromJSON CreateNewSupergroupChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "createNewSupergroupChat" -> parseCreateNewSupergroupChat v
   _ -> mempty
  where
   parseCreateNewSupergroupChat :: A.Value -> T.Parser CreateNewSupergroupChat
   parseCreateNewSupergroupChat = A.withObject "CreateNewSupergroupChat" $ \o -> do
    for_import <- o A..:? "for_import"
    location <- o A..:? "location"
    description <- o A..:? "description"
    is_channel <- o A..:? "is_channel"
    title <- o A..:? "title"
    return $ CreateNewSupergroupChat { for_import = for_import, location = location, description = description, is_channel = is_channel, title = title }
 parseJSON _ = mempty
