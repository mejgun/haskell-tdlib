-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetBankCardInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetBankCardInfo = 
 GetBankCardInfo { bank_card_number :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON GetBankCardInfo where
 toJSON (GetBankCardInfo { bank_card_number = bank_card_number }) =
  A.object [ "@type" A..= T.String "getBankCardInfo", "bank_card_number" A..= bank_card_number ]

instance T.FromJSON GetBankCardInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getBankCardInfo" -> parseGetBankCardInfo v
   _ -> mempty
  where
   parseGetBankCardInfo :: A.Value -> T.Parser GetBankCardInfo
   parseGetBankCardInfo = A.withObject "GetBankCardInfo" $ \o -> do
    bank_card_number <- o A..:? "bank_card_number"
    return $ GetBankCardInfo { bank_card_number = bank_card_number }