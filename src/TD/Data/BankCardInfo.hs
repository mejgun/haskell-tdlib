{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.BankCardInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.BankCardActionOpenUrl as BankCardActionOpenUrl
import qualified Utils as U

data BankCardInfo = -- | Information about a bank card @title Title of the bank card description @actions Actions that can be done with the bank card number
  BankCardInfo
  { -- |
    actions :: Maybe [BankCardActionOpenUrl.BankCardActionOpenUrl],
    -- |
    title :: Maybe String
  }
  deriving (Eq)

instance Show BankCardInfo where
  show
    BankCardInfo
      { actions = actions_,
        title = title_
      } =
      "BankCardInfo"
        ++ U.cc
          [ U.p "actions" actions_,
            U.p "title" title_
          ]

instance T.FromJSON BankCardInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "bankCardInfo" -> parseBankCardInfo v
      _ -> mempty
    where
      parseBankCardInfo :: A.Value -> T.Parser BankCardInfo
      parseBankCardInfo = A.withObject "BankCardInfo" $ \o -> do
        actions_ <- o A..:? "actions"
        title_ <- o A..:? "title"
        return $ BankCardInfo {actions = actions_, title = title_}
  parseJSON _ = mempty

instance T.ToJSON BankCardInfo where
  toJSON
    BankCardInfo
      { actions = actions_,
        title = title_
      } =
      A.object
        [ "@type" A..= T.String "bankCardInfo",
          "actions" A..= actions_,
          "title" A..= title_
        ]
