-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatDescription where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Changes information about a chat. Available for basic groups, supergroups, and channels. Requires can_change_info administrator right 
-- 
-- __chat_id__ Identifier of the chat
-- 
-- __param_description__ New chat description; 0-255 characters
data SetChatDescription = 

 SetChatDescription { description :: Maybe String, chat_id :: Maybe Int }  deriving (Eq)

instance Show SetChatDescription where
 show SetChatDescription { description=description, chat_id=chat_id } =
  "SetChatDescription" ++ cc [p "description" description, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SetChatDescription where
 toJSON SetChatDescription { description = description, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "setChatDescription", "description" A..= description, "chat_id" A..= chat_id ]

instance T.FromJSON SetChatDescription where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatDescription" -> parseSetChatDescription v
   _ -> mempty
  where
   parseSetChatDescription :: A.Value -> T.Parser SetChatDescription
   parseSetChatDescription = A.withObject "SetChatDescription" $ \o -> do
    description <- o A..:? "description"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetChatDescription { description = description, chat_id = chat_id }
 parseJSON _ = mempty
