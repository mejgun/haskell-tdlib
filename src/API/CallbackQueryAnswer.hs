-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CallbackQueryAnswer where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Contains a bot's answer to a callback query 
-- 
-- __text__ Text of the answer
-- 
-- __show_alert__ True, if an alert must be shown to the user instead of a toast notification
-- 
-- __url__ URL to be opened
data CallbackQueryAnswer = 

 CallbackQueryAnswer { url :: Maybe String, show_alert :: Maybe Bool, text :: Maybe String }  deriving (Eq)

instance Show CallbackQueryAnswer where
 show CallbackQueryAnswer { url=url, show_alert=show_alert, text=text } =
  "CallbackQueryAnswer" ++ U.cc [U.p "url" url, U.p "show_alert" show_alert, U.p "text" text ]

instance T.ToJSON CallbackQueryAnswer where
 toJSON CallbackQueryAnswer { url = url, show_alert = show_alert, text = text } =
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
    url <- o A..:? "url"
    show_alert <- o A..:? "show_alert"
    text <- o A..:? "text"
    return $ CallbackQueryAnswer { url = url, show_alert = show_alert, text = text }
 parseJSON _ = mempty
