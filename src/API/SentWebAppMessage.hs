-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.SentWebAppMessage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Information about the message sent by answerWebAppQuery 
-- 
-- __inline_message_id__ Identifier of the sent inline message, if known
data SentWebAppMessage = 

 SentWebAppMessage { inline_message_id :: Maybe String }  deriving (Eq)

instance Show SentWebAppMessage where
 show SentWebAppMessage { inline_message_id=inline_message_id } =
  "SentWebAppMessage" ++ cc [p "inline_message_id" inline_message_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SentWebAppMessage where
 toJSON SentWebAppMessage { inline_message_id = inline_message_id } =
  A.object [ "@type" A..= T.String "sentWebAppMessage", "inline_message_id" A..= inline_message_id ]

instance T.FromJSON SentWebAppMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sentWebAppMessage" -> parseSentWebAppMessage v
   _ -> mempty
  where
   parseSentWebAppMessage :: A.Value -> T.Parser SentWebAppMessage
   parseSentWebAppMessage = A.withObject "SentWebAppMessage" $ \o -> do
    inline_message_id <- o A..:? "inline_message_id"
    return $ SentWebAppMessage { inline_message_id = inline_message_id }
 parseJSON _ = mempty
