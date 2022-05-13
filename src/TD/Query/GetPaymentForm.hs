{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetPaymentForm where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ThemeParameters as ThemeParameters
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
      { theme = theme_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "GetPaymentForm"
        ++ U.cc
          [ U.p "theme" theme_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetPaymentForm where
  toJSON
    GetPaymentForm
      { theme = theme_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getPaymentForm",
          "theme" A..= theme_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
