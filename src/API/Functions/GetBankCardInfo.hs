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

