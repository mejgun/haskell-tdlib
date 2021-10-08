-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BankCardActionOpenUrl where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Describes an action associated with a bank card number 
-- 
-- __text__ Action text
-- 
-- __url__ The URL to be opened
data BankCardActionOpenUrl = 

 BankCardActionOpenUrl { url :: Maybe String, text :: Maybe String }  deriving (Eq)

instance Show BankCardActionOpenUrl where
 show BankCardActionOpenUrl { url=url, text=text } =
  "BankCardActionOpenUrl" ++ cc [p "url" url, p "text" text ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON BankCardActionOpenUrl where
 toJSON BankCardActionOpenUrl { url = url, text = text } =
  A.object [ "@type" A..= T.String "bankCardActionOpenUrl", "url" A..= url, "text" A..= text ]

instance T.FromJSON BankCardActionOpenUrl where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "bankCardActionOpenUrl" -> parseBankCardActionOpenUrl v
   _ -> mempty
  where
   parseBankCardActionOpenUrl :: A.Value -> T.Parser BankCardActionOpenUrl
   parseBankCardActionOpenUrl = A.withObject "BankCardActionOpenUrl" $ \o -> do
    url <- o A..:? "url"
    text <- o A..:? "text"
    return $ BankCardActionOpenUrl { url = url, text = text }
 parseJSON _ = mempty
