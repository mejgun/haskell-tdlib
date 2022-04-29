-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetMessageReaction where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Changes chosen reaction for a message
-- 
-- __chat_id__ Identifier of the chat to which the message belongs
-- 
-- __message_id__ Identifier of the message
-- 
-- __reaction__ Text representation of the new chosen reaction. Can be an empty string or the currently chosen non-big reaction to remove the reaction
-- 
-- __is_big__ Pass true if the reaction is added with a big animation
data SetMessageReaction = 

 SetMessageReaction { is_big :: Maybe Bool, reaction :: Maybe String, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show SetMessageReaction where
 show SetMessageReaction { is_big=is_big, reaction=reaction, message_id=message_id, chat_id=chat_id } =
  "SetMessageReaction" ++ cc [p "is_big" is_big, p "reaction" reaction, p "message_id" message_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SetMessageReaction where
 toJSON SetMessageReaction { is_big = is_big, reaction = reaction, message_id = message_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "setMessageReaction", "is_big" A..= is_big, "reaction" A..= reaction, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON SetMessageReaction where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setMessageReaction" -> parseSetMessageReaction v
   _ -> mempty
  where
   parseSetMessageReaction :: A.Value -> T.Parser SetMessageReaction
   parseSetMessageReaction = A.withObject "SetMessageReaction" $ \o -> do
    is_big <- o A..:? "is_big"
    reaction <- o A..:? "reaction"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetMessageReaction { is_big = is_big, reaction = reaction, message_id = message_id, chat_id = chat_id }
 parseJSON _ = mempty
