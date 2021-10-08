-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PaymentFormTheme where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Theme colors for a payment form 
-- 
-- __background_color__ A color of the payment form background in the RGB24 format
-- 
-- __text_color__ A color of text in the RGB24 format
-- 
-- __hint_color__ A color of hints in the RGB24 format
-- 
-- __link_color__ A color of links in the RGB24 format
-- 
-- __button_color__ A color of thebuttons in the RGB24 format
-- 
-- __button_text_color__ A color of text on the buttons in the RGB24 format
data PaymentFormTheme = 

 PaymentFormTheme { button_text_color :: Maybe Int, button_color :: Maybe Int, link_color :: Maybe Int, hint_color :: Maybe Int, text_color :: Maybe Int, background_color :: Maybe Int }  deriving (Eq)

instance Show PaymentFormTheme where
 show PaymentFormTheme { button_text_color=button_text_color, button_color=button_color, link_color=link_color, hint_color=hint_color, text_color=text_color, background_color=background_color } =
  "PaymentFormTheme" ++ cc [p "button_text_color" button_text_color, p "button_color" button_color, p "link_color" link_color, p "hint_color" hint_color, p "text_color" text_color, p "background_color" background_color ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON PaymentFormTheme where
 toJSON PaymentFormTheme { button_text_color = button_text_color, button_color = button_color, link_color = link_color, hint_color = hint_color, text_color = text_color, background_color = background_color } =
  A.object [ "@type" A..= T.String "paymentFormTheme", "button_text_color" A..= button_text_color, "button_color" A..= button_color, "link_color" A..= link_color, "hint_color" A..= hint_color, "text_color" A..= text_color, "background_color" A..= background_color ]

instance T.FromJSON PaymentFormTheme where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "paymentFormTheme" -> parsePaymentFormTheme v
   _ -> mempty
  where
   parsePaymentFormTheme :: A.Value -> T.Parser PaymentFormTheme
   parsePaymentFormTheme = A.withObject "PaymentFormTheme" $ \o -> do
    button_text_color <- mconcat [ o A..:? "button_text_color", readMaybe <$> (o A..: "button_text_color" :: T.Parser String)] :: T.Parser (Maybe Int)
    button_color <- mconcat [ o A..:? "button_color", readMaybe <$> (o A..: "button_color" :: T.Parser String)] :: T.Parser (Maybe Int)
    link_color <- mconcat [ o A..:? "link_color", readMaybe <$> (o A..: "link_color" :: T.Parser String)] :: T.Parser (Maybe Int)
    hint_color <- mconcat [ o A..:? "hint_color", readMaybe <$> (o A..: "hint_color" :: T.Parser String)] :: T.Parser (Maybe Int)
    text_color <- mconcat [ o A..:? "text_color", readMaybe <$> (o A..: "text_color" :: T.Parser String)] :: T.Parser (Maybe Int)
    background_color <- mconcat [ o A..:? "background_color", readMaybe <$> (o A..: "background_color" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ PaymentFormTheme { button_text_color = button_text_color, button_color = button_color, link_color = link_color, hint_color = hint_color, text_color = text_color, background_color = background_color }
 parseJSON _ = mempty
