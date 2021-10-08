-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessagePublicForwards where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns forwarded copies of a channel message to different public channels. For optimal performance, the number of returned messages is chosen by TDLib
-- 
-- __chat_id__ Chat identifier of the message
-- 
-- __message_id__ Message identifier
-- 
-- __offset__ Offset of the first entry to return as received from the previous request; use empty string to get first chunk of results
-- 
-- __limit__ The maximum number of messages to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
data GetMessagePublicForwards = 

 GetMessagePublicForwards { limit :: Maybe Int, offset :: Maybe String, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show GetMessagePublicForwards where
 show GetMessagePublicForwards { limit=limit, offset=offset, message_id=message_id, chat_id=chat_id } =
  "GetMessagePublicForwards" ++ cc [p "limit" limit, p "offset" offset, p "message_id" message_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetMessagePublicForwards where
 toJSON GetMessagePublicForwards { limit = limit, offset = offset, message_id = message_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getMessagePublicForwards", "limit" A..= limit, "offset" A..= offset, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetMessagePublicForwards where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getMessagePublicForwards" -> parseGetMessagePublicForwards v
   _ -> mempty
  where
   parseGetMessagePublicForwards :: A.Value -> T.Parser GetMessagePublicForwards
   parseGetMessagePublicForwards = A.withObject "GetMessagePublicForwards" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset <- o A..:? "offset"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetMessagePublicForwards { limit = limit, offset = offset, message_id = message_id, chat_id = chat_id }
 parseJSON _ = mempty
