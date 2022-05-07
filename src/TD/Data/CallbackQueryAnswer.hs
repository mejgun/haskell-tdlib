{-# LANGUAGE OverloadedStrings #-}

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
      { url = url,
        show_alert = show_alert,
        text = text
      } =
      "CallbackQueryAnswer"
        ++ U.cc
          [ U.p "url" url,
            U.p "show_alert" show_alert,
            U.p "text" text
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
      { url = url,
        show_alert = show_alert,
        text = text
      } =
      A.object
        [ "@type" A..= T.String "callbackQueryAnswer",
          "url" A..= url,
          "show_alert" A..= show_alert,
          "text" A..= text
        ]
