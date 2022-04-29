-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPaymentForm where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ThemeParameters as ThemeParameters

-- |
-- 
-- Returns an invoice payment form. This method must be called when the user presses inlineKeyboardButtonBuy
-- 
-- __chat_id__ Chat identifier of the Invoice message
-- 
-- __message_id__ Message identifier
-- 
-- __theme__ Preferred payment form theme; pass null to use the default theme
data GetPaymentForm = 

 GetPaymentForm { theme :: Maybe ThemeParameters.ThemeParameters, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show GetPaymentForm where
 show GetPaymentForm { theme=theme, message_id=message_id, chat_id=chat_id } =
  "GetPaymentForm" ++ cc [p "theme" theme, p "message_id" message_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetPaymentForm where
 toJSON GetPaymentForm { theme = theme, message_id = message_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getPaymentForm", "theme" A..= theme, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetPaymentForm where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getPaymentForm" -> parseGetPaymentForm v
   _ -> mempty
  where
   parseGetPaymentForm :: A.Value -> T.Parser GetPaymentForm
   parseGetPaymentForm = A.withObject "GetPaymentForm" $ \o -> do
    theme <- o A..:? "theme"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetPaymentForm { theme = theme, message_id = message_id, chat_id = chat_id }
 parseJSON _ = mempty
