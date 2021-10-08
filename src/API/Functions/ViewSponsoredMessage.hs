-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ViewSponsoredMessage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Informs TDLib that a sponsored message was viewed by the user 
-- 
-- __chat_id__ Identifier of the chat with the sponsored message
-- 
-- __sponsored_message_id__ The identifier of the sponsored message being viewed
data ViewSponsoredMessage = 

 ViewSponsoredMessage { sponsored_message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show ViewSponsoredMessage where
 show ViewSponsoredMessage { sponsored_message_id=sponsored_message_id, chat_id=chat_id } =
  "ViewSponsoredMessage" ++ cc [p "sponsored_message_id" sponsored_message_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ViewSponsoredMessage where
 toJSON ViewSponsoredMessage { sponsored_message_id = sponsored_message_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "viewSponsoredMessage", "sponsored_message_id" A..= sponsored_message_id, "chat_id" A..= chat_id ]

instance T.FromJSON ViewSponsoredMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "viewSponsoredMessage" -> parseViewSponsoredMessage v
   _ -> mempty
  where
   parseViewSponsoredMessage :: A.Value -> T.Parser ViewSponsoredMessage
   parseViewSponsoredMessage = A.withObject "ViewSponsoredMessage" $ \o -> do
    sponsored_message_id <- mconcat [ o A..:? "sponsored_message_id", readMaybe <$> (o A..: "sponsored_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ViewSponsoredMessage { sponsored_message_id = sponsored_message_id, chat_id = chat_id }
 parseJSON _ = mempty
