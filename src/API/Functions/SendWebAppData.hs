-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendWebAppData where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Sends data received from a keyboardButtonTypeWebApp web app to a bot
-- 
-- __bot_user_id__ Identifier of the target bot
-- 
-- __button_text__ Text of the keyboardButtonTypeWebApp button, which opened the web app
-- 
-- __data__ Received data
data SendWebAppData = 

 SendWebAppData { _data :: Maybe String, button_text :: Maybe String, bot_user_id :: Maybe Int }  deriving (Eq)

instance Show SendWebAppData where
 show SendWebAppData { _data=_data, button_text=button_text, bot_user_id=bot_user_id } =
  "SendWebAppData" ++ cc [p "_data" _data, p "button_text" button_text, p "bot_user_id" bot_user_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SendWebAppData where
 toJSON SendWebAppData { _data = _data, button_text = button_text, bot_user_id = bot_user_id } =
  A.object [ "@type" A..= T.String "sendWebAppData", "data" A..= _data, "button_text" A..= button_text, "bot_user_id" A..= bot_user_id ]

instance T.FromJSON SendWebAppData where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendWebAppData" -> parseSendWebAppData v
   _ -> mempty
  where
   parseSendWebAppData :: A.Value -> T.Parser SendWebAppData
   parseSendWebAppData = A.withObject "SendWebAppData" $ \o -> do
    _data <- o A..:? "data"
    button_text <- o A..:? "button_text"
    bot_user_id <- mconcat [ o A..:? "bot_user_id", readMaybe <$> (o A..: "bot_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SendWebAppData { _data = _data, button_text = button_text, bot_user_id = bot_user_id }
 parseJSON _ = mempty
