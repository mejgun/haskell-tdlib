-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BankCardInfo where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.BankCardActionOpenUrl as BankCardActionOpenUrl

data BankCardInfo = 
 BankCardInfo { actions :: Maybe [BankCardActionOpenUrl.BankCardActionOpenUrl], title :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON BankCardInfo where
 toJSON (BankCardInfo { actions = actions, title = title }) =
  A.object [ "@type" A..= T.String "bankCardInfo", "actions" A..= actions, "title" A..= title ]

instance T.FromJSON BankCardInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "bankCardInfo" -> parseBankCardInfo v
   _ -> mempty
  where
   parseBankCardInfo :: A.Value -> T.Parser BankCardInfo
   parseBankCardInfo = A.withObject "BankCardInfo" $ \o -> do
    actions <- optional $ o A..: "actions"
    title <- optional $ o A..: "title"
    return $ BankCardInfo { actions = actions, title = title }