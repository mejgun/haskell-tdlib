-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatAdministrators where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns a list of administrators of the chat with their custom titles 
-- 
-- __chat_id__ Chat identifier
data GetChatAdministrators = 

 GetChatAdministrators { chat_id :: Maybe Int }  deriving (Eq)

instance Show GetChatAdministrators where
 show GetChatAdministrators { chat_id=chat_id } =
  "GetChatAdministrators" ++ cc [p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetChatAdministrators where
 toJSON GetChatAdministrators { chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getChatAdministrators", "chat_id" A..= chat_id ]

instance T.FromJSON GetChatAdministrators where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatAdministrators" -> parseGetChatAdministrators v
   _ -> mempty
  where
   parseGetChatAdministrators :: A.Value -> T.Parser GetChatAdministrators
   parseGetChatAdministrators = A.withObject "GetChatAdministrators" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChatAdministrators { chat_id = chat_id }
 parseJSON _ = mempty
