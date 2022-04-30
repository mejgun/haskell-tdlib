-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetBankCardInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns information about a bank card 
-- 
-- __bank_card_number__ The bank card number
data GetBankCardInfo = 

 GetBankCardInfo { bank_card_number :: Maybe String }  deriving (Eq)

instance Show GetBankCardInfo where
 show GetBankCardInfo { bank_card_number=bank_card_number } =
  "GetBankCardInfo" ++ U.cc [U.p "bank_card_number" bank_card_number ]

instance T.ToJSON GetBankCardInfo where
 toJSON GetBankCardInfo { bank_card_number = bank_card_number } =
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
 parseJSON _ = mempty
