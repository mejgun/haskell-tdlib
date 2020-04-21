-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BankCardInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.BankCardActionOpenUrl as BankCardActionOpenUrl

--main = putStrLn "ok"

data BankCardInfo = 
 BankCardInfo { actions :: [BankCardActionOpenUrl.BankCardActionOpenUrl], title :: String }  deriving (Show)

instance T.ToJSON BankCardInfo where
 toJSON (BankCardInfo { actions = actions, title = title }) =
  A.object [ "@type" A..= T.String "bankCardInfo", "actions" A..= actions, "title" A..= title ]



instance T.FromJSON BankCardInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "bankCardInfo" -> parseBankCardInfo v

   _ -> mempty ""
  where
   parseBankCardInfo :: A.Value -> T.Parser BankCardInfo
   parseBankCardInfo = A.withObject "BankCardInfo" $ \o -> do
    actions <- o A..: "actions"
    title <- o A..: "title"
    return $ BankCardInfo { actions = actions, title = title }