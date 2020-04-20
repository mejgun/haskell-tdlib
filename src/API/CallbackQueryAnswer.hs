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

