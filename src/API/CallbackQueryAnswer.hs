-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CallbackQueryAnswer where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data CallbackQueryAnswer = 
 CallbackQueryAnswer { url :: Maybe String, show_alert :: Maybe Bool, text :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON CallbackQueryAnswer where
 toJSON (CallbackQueryAnswer { url = url, show_alert = show_alert, text = text }) =
  A.object [ "@type" A..= T.String "callbackQueryAnswer", "url" A..= url, "show_alert" A..= show_alert, "text" A..= text ]

instance T.FromJSON CallbackQueryAnswer where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "callbackQueryAnswer" -> parseCallbackQueryAnswer v
   _ -> mempty
  where
   parseCallbackQueryAnswer :: A.Value -> T.Parser CallbackQueryAnswer
   parseCallbackQueryAnswer = A.withObject "CallbackQueryAnswer" $ \o -> do
    url <- optional $ o A..: "url"
    show_alert <- optional $ o A..: "show_alert"
    text <- optional $ o A..: "text"
    return $ CallbackQueryAnswer { url = url, show_alert = show_alert, text = text }