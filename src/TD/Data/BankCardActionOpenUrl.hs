{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.BankCardActionOpenUrl where

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
      { url = url_,
        text = text_
      } =
      "BankCardActionOpenUrl"
        ++ U.cc
          [ U.p "url" url_,
            U.p "text" text_
          ]

instance T.FromJSON BankCardActionOpenUrl where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "bankCardActionOpenUrl" -> parseBankCardActionOpenUrl v
      _ -> mempty
    where
      parseBankCardActionOpenUrl :: A.Value -> T.Parser BankCardActionOpenUrl
      parseBankCardActionOpenUrl = A.withObject "BankCardActionOpenUrl" $ \o -> do
        url_ <- o A..:? "url"
        text_ <- o A..:? "text"
        return $ BankCardActionOpenUrl {url = url_, text = text_}
  parseJSON _ = mempty

instance T.ToJSON BankCardActionOpenUrl where
  toJSON
    BankCardActionOpenUrl
      { url = url_,
        text = text_
      } =
      A.object
        [ "@type" A..= T.String "bankCardActionOpenUrl",
          "url" A..= url_,
          "text" A..= text_
        ]
