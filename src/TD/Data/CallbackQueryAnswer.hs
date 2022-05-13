{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.CallbackQueryAnswer where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data CallbackQueryAnswer = -- | Contains a bot's answer to a callback query @text Text of the answer @show_alert True, if an alert must be shown to the user instead of a toast notification @url URL to be opened
  CallbackQueryAnswer
  { -- |
    url :: Maybe String,
    -- |
    show_alert :: Maybe Bool,
    -- |
    text :: Maybe String
  }
  deriving (Eq)

instance Show CallbackQueryAnswer where
  show
    CallbackQueryAnswer
      { url = url_,
        show_alert = show_alert_,
        text = text_
      } =
      "CallbackQueryAnswer"
        ++ U.cc
          [ U.p "url" url_,
            U.p "show_alert" show_alert_,
            U.p "text" text_
          ]

instance T.FromJSON CallbackQueryAnswer where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "callbackQueryAnswer" -> parseCallbackQueryAnswer v
      _ -> mempty
    where
      parseCallbackQueryAnswer :: A.Value -> T.Parser CallbackQueryAnswer
      parseCallbackQueryAnswer = A.withObject "CallbackQueryAnswer" $ \o -> do
        url_ <- o A..:? "url"
        show_alert_ <- o A..:? "show_alert"
        text_ <- o A..:? "text"
        return $ CallbackQueryAnswer {url = url_, show_alert = show_alert_, text = text_}
  parseJSON _ = mempty

instance T.ToJSON CallbackQueryAnswer where
  toJSON
    CallbackQueryAnswer
      { url = url_,
        show_alert = show_alert_,
        text = text_
      } =
      A.object
        [ "@type" A..= T.String "callbackQueryAnswer",
          "url" A..= url_,
          "show_alert" A..= show_alert_,
          "text" A..= text_
        ]
