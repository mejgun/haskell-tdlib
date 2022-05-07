{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetPaymentForm where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.ThemeParameters as ThemeParameters
import qualified Utils as U

-- |
-- Returns an invoice payment form. This method must be called when the user presses inlineKeyboardButtonBuy
data GetPaymentForm = GetPaymentForm
  { -- | Preferred payment form theme; pass null to use the default theme
    theme :: Maybe ThemeParameters.ThemeParameters,
    -- | Message identifier
    message_id :: Maybe Int,
    -- | Chat identifier of the Invoice message
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetPaymentForm where
  show
    GetPaymentForm
      { theme = theme,
        message_id = message_id,
        chat_id = chat_id
      } =
      "GetPaymentForm"
        ++ U.cc
          [ U.p "theme" theme,
            U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON GetPaymentForm where
  toJSON
    GetPaymentForm
      { theme = theme,
        message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "getPaymentForm",
          "theme" A..= theme,
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
