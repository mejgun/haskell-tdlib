-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendCallRating where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.CallProblem as CallProblem

-- |
-- 
-- Sends a call rating 
-- 
-- __call_id__ Call identifier
-- 
-- __rating__ Call rating; 1-5
-- 
-- __comment__ An optional user comment if the rating is less than 5
-- 
-- __problems__ List of the exact types of problems with the call, specified by the user
data SendCallRating = 

 SendCallRating { problems :: Maybe [CallProblem.CallProblem], comment :: Maybe String, rating :: Maybe Int, call_id :: Maybe Int }  deriving (Eq)

instance Show SendCallRating where
 show SendCallRating { problems=problems, comment=comment, rating=rating, call_id=call_id } =
  "SendCallRating" ++ cc [p "problems" problems, p "comment" comment, p "rating" rating, p "call_id" call_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SendCallRating where
 toJSON SendCallRating { problems = problems, comment = comment, rating = rating, call_id = call_id } =
  A.object [ "@type" A..= T.String "sendCallRating", "problems" A..= problems, "comment" A..= comment, "rating" A..= rating, "call_id" A..= call_id ]

instance T.FromJSON SendCallRating where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendCallRating" -> parseSendCallRating v
   _ -> mempty
  where
   parseSendCallRating :: A.Value -> T.Parser SendCallRating
   parseSendCallRating = A.withObject "SendCallRating" $ \o -> do
    problems <- o A..:? "problems"
    comment <- o A..:? "comment"
    rating <- mconcat [ o A..:? "rating", readMaybe <$> (o A..: "rating" :: T.Parser String)] :: T.Parser (Maybe Int)
    call_id <- mconcat [ o A..:? "call_id", readMaybe <$> (o A..: "call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SendCallRating { problems = problems, comment = comment, rating = rating, call_id = call_id }
 parseJSON _ = mempty
