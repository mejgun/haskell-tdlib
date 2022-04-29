-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ReadAllChatReactions where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Marks all reactions in a chat as read 
-- 
-- __chat_id__ Chat identifier
data ReadAllChatReactions = 

 ReadAllChatReactions { chat_id :: Maybe Int }  deriving (Eq)

instance Show ReadAllChatReactions where
 show ReadAllChatReactions { chat_id=chat_id } =
  "ReadAllChatReactions" ++ cc [p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ReadAllChatReactions where
 toJSON ReadAllChatReactions { chat_id = chat_id } =
  A.object [ "@type" A..= T.String "readAllChatReactions", "chat_id" A..= chat_id ]

instance T.FromJSON ReadAllChatReactions where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "readAllChatReactions" -> parseReadAllChatReactions v
   _ -> mempty
  where
   parseReadAllChatReactions :: A.Value -> T.Parser ReadAllChatReactions
   parseReadAllChatReactions = A.withObject "ReadAllChatReactions" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ReadAllChatReactions { chat_id = chat_id }
 parseJSON _ = mempty
