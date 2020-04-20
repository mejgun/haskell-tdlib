-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CallbackQueryAnswer where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CallbackQueryAnswer = 
 CallbackQueryAnswer { url :: String, show_alert :: Bool, text :: String }  -- deriving (Show)

instance T.ToJSON CallbackQueryAnswer where
 toJSON (CallbackQueryAnswer { url = url, show_alert = show_alert, text = text }) =
  A.object [ "@type" A..= T.String "callbackQueryAnswer", "url" A..= url, "show_alert" A..= show_alert, "text" A..= text ]
-- callbackQueryAnswer CallbackQueryAnswer  { url :: String, show_alert :: Bool, text :: String } 



instance T.FromJSON CallbackQueryAnswer where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "callbackQueryAnswer" -> parseCallbackQueryAnswer v
  where
   parseCallbackQueryAnswer :: A.Value -> T.Parser CallbackQueryAnswer
   parseCallbackQueryAnswer = A.withObject "CallbackQueryAnswer" $ \o -> do
    url <- o A..: "url"
    show_alert <- o A..: "show_alert"
    text <- o A..: "text"
    return $ CallbackQueryAnswer { url = url, show_alert = show_alert, text = text }