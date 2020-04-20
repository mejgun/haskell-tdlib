-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetBankCardInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetBankCardInfo = 
 GetBankCardInfo { bank_card_number :: String }  -- deriving (Show)

instance T.ToJSON GetBankCardInfo where
 toJSON (GetBankCardInfo { bank_card_number = bank_card_number }) =
  A.object [ "@type" A..= T.String "getBankCardInfo", "bank_card_number" A..= bank_card_number ]
-- getBankCardInfo GetBankCardInfo  { bank_card_number :: String } 



instance T.FromJSON GetBankCardInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getBankCardInfo" -> parseGetBankCardInfo v
  where
   parseGetBankCardInfo :: A.Value -> T.Parser GetBankCardInfo
   parseGetBankCardInfo = A.withObject "GetBankCardInfo" $ \o -> do
    bank_card_number <- o A..: "bank_card_number"
    return $ GetBankCardInfo { bank_card_number = bank_card_number }