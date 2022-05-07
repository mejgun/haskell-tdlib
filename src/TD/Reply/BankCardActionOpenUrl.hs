{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.BankCardActionOpenUrl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data BankCardActionOpenUrl = -- | Describes an action associated with a bank card number @text Action text @url The URL to be opened
  BankCardActionOpenUrl
  { -- |
    url :: Maybe String,
    -- |
    text :: Maybe String
  }
  deriving (Eq)

instance Show BankCardActionOpenUrl where
  show
    BankCardActionOpenUrl
      { url = url,
        text = text
      } =
      "BankCardActionOpenUrl"
        ++ U.cc
          [ U.p "url" url,
            U.p "text" text
          ]

instance T.FromJSON BankCardActionOpenUrl where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "bankCardActionOpenUrl" -> parseBankCardActionOpenUrl v
      _ -> fail ""
    where
      parseBankCardActionOpenUrl :: A.Value -> T.Parser BankCardActionOpenUrl
      parseBankCardActionOpenUrl = A.withObject "BankCardActionOpenUrl" $ \o -> do
        url_ <- o A..:? "url"
        text_ <- o A..:? "text"
        return $ BankCardActionOpenUrl {url = url_, text = text_}
  parseJSON _ = fail ""

instance T.ToJSON BankCardActionOpenUrl where
  toJSON
    BankCardActionOpenUrl
      { url = url,
        text = text
      } =
      A.object
        [ "@type" A..= T.String "bankCardActionOpenUrl",
          "url" A..= url,
          "text" A..= text
        ]
