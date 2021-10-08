-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.OpenChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Informs TDLib that the chat is opened by the user. Many useful activities depend on the chat being opened or closed (e.g., in supergroups and channels all updates are received only for opened chats) 
-- 
-- __chat_id__ Chat identifier
data OpenChat = 

 OpenChat { chat_id :: Maybe Int }  deriving (Eq)

instance Show OpenChat where
 show OpenChat { chat_id=chat_id } =
  "OpenChat" ++ cc [p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON OpenChat where
 toJSON OpenChat { chat_id = chat_id } =
  A.object [ "@type" A..= T.String "openChat", "chat_id" A..= chat_id ]

instance T.FromJSON OpenChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "openChat" -> parseOpenChat v
   _ -> mempty
  where
   parseOpenChat :: A.Value -> T.Parser OpenChat
   parseOpenChat = A.withObject "OpenChat" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ OpenChat { chat_id = chat_id }
 parseJSON _ = mempty
