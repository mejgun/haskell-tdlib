-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PassportElements where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.PassportElement as PassportElement

-- |
-- 
-- Contains information about saved Telegram Passport elements 
-- 
-- __elements__ Telegram Passport elements
data PassportElements = 

 PassportElements { elements :: Maybe [PassportElement.PassportElement] }  deriving (Eq)

instance Show PassportElements where
 show PassportElements { elements=elements } =
  "PassportElements" ++ cc [p "elements" elements ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON PassportElements where
 toJSON PassportElements { elements = elements } =
  A.object [ "@type" A..= T.String "passportElements", "elements" A..= elements ]

instance T.FromJSON PassportElements where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "passportElements" -> parsePassportElements v
   _ -> mempty
  where
   parsePassportElements :: A.Value -> T.Parser PassportElements
   parsePassportElements = A.withObject "PassportElements" $ \o -> do
    elements <- o A..:? "elements"
    return $ PassportElements { elements = elements }
 parseJSON _ = mempty
